#DB SERVER FILE
from flask import Flask, render_template, request, redirect, url_for
from flask_mysqldb import MySQL
import config

app = Flask(__name__)
app.config.from_object(config)

mysql = MySQL(app)


# ---------------- HOME ----------------

@app.route('/')
def index():
    return redirect(url_for('clubs'))


# ---------------- CLUBS ----------------

# view all clubs
@app.route('/clubs')
def clubs():
    cur = mysql.connection.cursor()

    cur.execute("""
        SELECT ClubID, ClubName, ClubDescription, ClubCreationDate
        FROM club
        ORDER BY ClubName
    """)
    clubs = cur.fetchall()

    cur.execute("""
        SELECT CategoryID, CategoryName
        FROM category
        ORDER BY CategoryName
    """)
    categories = cur.fetchall()

    cur.close()
    return render_template('clubs.html', clubs=clubs, categories=categories)


# search clubs by name or description
@app.route('/search_clubs', methods=['GET'])
def search_clubs():
    keyword = request.args.get('keyword')

    cur = mysql.connection.cursor()

    cur.execute("""
        SELECT ClubID, ClubName, ClubDescription, ClubCreationDate
        FROM club
        WHERE ClubName LIKE %s
           OR ClubDescription LIKE %s
        ORDER BY ClubName
    """, ('%' + keyword + '%', '%' + keyword + '%'))

    clubs = cur.fetchall()

    cur.execute("""
        SELECT CategoryID, CategoryName
        FROM category
        ORDER BY CategoryName
    """)
    categories = cur.fetchall()

    cur.close()
    return render_template('clubs.html', clubs=clubs, categories=categories)


# filter clubs by category name
@app.route('/filter_clubs', methods=['GET'])
def filter_clubs():
    category_name = request.args.get('category_name')

    cur = mysql.connection.cursor()

    cur.execute("""
        SELECT DISTINCT c.ClubID, c.ClubName, c.ClubDescription, c.ClubCreationDate
        FROM club c
        JOIN clubcategory cc ON c.ClubID = cc.ClubID
        JOIN category ca ON cc.CategoryID = ca.CategoryID
        WHERE ca.CategoryName = %s
        ORDER BY c.ClubName
    """, (category_name,))

    clubs = cur.fetchall()

    cur.execute("""
        SELECT CategoryID, CategoryName
        FROM category
        ORDER BY CategoryName
    """)
    categories = cur.fetchall()

    cur.close()
    return render_template('clubs.html', clubs=clubs, categories=categories)


# add club
@app.route('/add_club', methods=['GET', 'POST'])
def add_club():
    cur = mysql.connection.cursor()

    if request.method == 'POST':
        club_id = request.form['club_id']
        club_name = request.form['club_name']
        club_description = request.form['club_description']
        category_id = request.form['category_id']

        cur.execute("""
            INSERT INTO club
            (ClubID, ClubName, ClubDescription, ClubCreationDate)
            VALUES (%s, %s, %s, CURDATE())
        """, (club_id, club_name, club_description))

        cur.execute("""
            INSERT INTO clubcategory
            (ClubID, CategoryID)
            VALUES (%s, %s)
        """, (club_id, category_id))

        mysql.connection.commit()
        cur.close()

        return redirect(url_for('clubs'))

    cur.execute("""
        SELECT CategoryID, CategoryName
        FROM category
        ORDER BY CategoryName
    """)
    categories = cur.fetchall()

    cur.close()
    return render_template('add_club.html', categories=categories)


# edit club
@app.route('/edit_club/<club_id>', methods=['GET', 'POST'])
def edit_club(club_id):
    cur = mysql.connection.cursor()

    if request.method == 'POST':
        club_name = request.form['club_name']
        club_description = request.form['club_description']

        cur.execute("""
            UPDATE club
            SET ClubName = %s,
                ClubDescription = %s
            WHERE ClubID = %s
        """, (club_name, club_description, club_id))

        mysql.connection.commit()
        cur.close()

        return redirect(url_for('clubs'))

    cur.execute("""
        SELECT ClubID, ClubName, ClubDescription
        FROM club
        WHERE ClubID = %s
    """, (club_id,))
    club = cur.fetchone()

    cur.close()
    return render_template('edit_club.html', club=club)


# delete club
@app.route('/delete_club/<club_id>', methods=['POST'])
def delete_club(club_id):
    cur = mysql.connection.cursor()

    cur.execute("""
        DELETE FROM attendance
        WHERE EventID IN (
            SELECT EventID FROM event WHERE ClubID = %s
        )
    """, (club_id,))

    cur.execute("""
        DELETE FROM rsvp
        WHERE EventID IN (
            SELECT EventID FROM event WHERE ClubID = %s
        )
    """, (club_id,))

    cur.execute("DELETE FROM event WHERE ClubID = %s", (club_id,))
    cur.execute("DELETE FROM announcement WHERE ClubID = %s", (club_id,))
    cur.execute("DELETE FROM clubmembership WHERE ClubID = %s", (club_id,))
    cur.execute("DELETE FROM clubcategory WHERE ClubID = %s", (club_id,))
    cur.execute("DELETE FROM joinrequest WHERE ClubID = %s", (club_id,))
    cur.execute("DELETE FROM club WHERE ClubID = %s", (club_id,))

    mysql.connection.commit()
    cur.close()

    return redirect(url_for('clubs'))


# ---------------- EVENTS ----------------

# view all events
@app.route('/events')
def events():
    cur = mysql.connection.cursor()

    cur.execute("""
        SELECT e.EventID, e.EventTitle, e.EventDescription, e.EventStartTime,
               e.EventEndTime, e.EventCapacity, e.EventStatus, e.EventVisibility,
               c.ClubName, et.EventTypeName, l.BuildingName, l.RoomNumber
        FROM event e
        JOIN club c ON e.ClubID = c.ClubID
        JOIN eventtype et ON e.EventTypeID = et.EventTypeID
        JOIN location l ON e.LocationID = l.LocationID
        ORDER BY e.EventStartTime
    """)
    events = cur.fetchall()

    cur.close()
    return render_template('events.html', events=events)


# search events
@app.route('/search_events', methods=['GET'])
def search_events():
    keyword = request.args.get('keyword')

    cur = mysql.connection.cursor()

    cur.execute("""
        SELECT e.EventID, e.EventTitle, e.EventDescription, e.EventStartTime,
               e.EventEndTime, e.EventCapacity, e.EventStatus, e.EventVisibility,
               c.ClubName, et.EventTypeName, l.BuildingName, l.RoomNumber
        FROM event e
        JOIN club c ON e.ClubID = c.ClubID
        JOIN eventtype et ON e.EventTypeID = et.EventTypeID
        JOIN location l ON e.LocationID = l.LocationID
        WHERE e.EventTitle LIKE %s
           OR e.EventDescription LIKE %s
        ORDER BY e.EventStartTime
    """, ('%' + keyword + '%', '%' + keyword + '%'))

    events = cur.fetchall()

    cur.close()
    return render_template('events.html', events=events)


# filter events by club
@app.route('/filter_events_by_club', methods=['GET'])
def filter_events_by_club():
    club_id = request.args.get('club_id')

    cur = mysql.connection.cursor()

    cur.execute("""
        SELECT e.EventID, e.EventTitle, e.EventDescription, e.EventStartTime,
               e.EventEndTime, e.EventCapacity, e.EventStatus, e.EventVisibility,
               c.ClubName, et.EventTypeName, l.BuildingName, l.RoomNumber
        FROM event e
        JOIN club c ON e.ClubID = c.ClubID
        JOIN eventtype et ON e.EventTypeID = et.EventTypeID
        JOIN location l ON e.LocationID = l.LocationID
        WHERE e.ClubID = %s
        ORDER BY e.EventStartTime
    """, (club_id,))

    events = cur.fetchall()

    cur.close()
    return render_template('events.html', events=events)


# add event
@app.route('/add_event', methods=['GET', 'POST'])
def add_event():
    cur = mysql.connection.cursor()

    if request.method == 'POST':
        event_id = request.form['event_id']
        event_title = request.form['event_title']
        event_description = request.form['event_description']
        event_start_time = request.form['event_start_time']
        event_end_time = request.form['event_end_time']
        event_capacity = request.form['event_capacity']
        event_status = request.form['event_status']
        event_visibility = request.form['event_visibility']
        event_type_id = request.form['event_type_id']
        location_id = request.form['location_id']
        club_id = request.form['club_id']

        cur.execute("""
            INSERT INTO event
            (EventID, EventTitle, EventDescription, EventStartTime, EventEndTime,
             EventCapacity, EventStatus, EventVisibility, EventTypeID, LocationID, ClubID)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """, (event_id, event_title, event_description, event_start_time,
              event_end_time, event_capacity, event_status, event_visibility,
              event_type_id, location_id, club_id))

        mysql.connection.commit()
        cur.close()

        return redirect(url_for('events'))

    cur.execute("SELECT ClubID, ClubName FROM club ORDER BY ClubName")
    clubs = cur.fetchall()

    cur.execute("SELECT EventTypeID, EventTypeName FROM eventtype ORDER BY EventTypeName")
    event_types = cur.fetchall()

    cur.execute("SELECT LocationID, BuildingName, RoomNumber FROM location ORDER BY BuildingName")
    locations = cur.fetchall()

    cur.close()

    return render_template(
        'add_event.html',
        clubs=clubs,
        event_types=event_types,
        locations=locations
    )


# edit event
@app.route('/edit_event/<event_id>', methods=['GET', 'POST'])
def edit_event(event_id):
    cur = mysql.connection.cursor()

    if request.method == 'POST':
        event_title = request.form['event_title']
        event_description = request.form['event_description']
        event_start_time = request.form['event_start_time']
        event_end_time = request.form['event_end_time']
        event_capacity = request.form['event_capacity']
        event_status = request.form['event_status']
        event_visibility = request.form['event_visibility']

        cur.execute("""
            UPDATE event
            SET EventTitle = %s,
                EventDescription = %s,
                EventStartTime = %s,
                EventEndTime = %s,
                EventCapacity = %s,
                EventStatus = %s,
                EventVisibility = %s
            WHERE EventID = %s
        """, (event_title, event_description, event_start_time, event_end_time,
              event_capacity, event_status, event_visibility, event_id))

        mysql.connection.commit()
        cur.close()

        return redirect(url_for('events'))

    cur.execute("""
        SELECT EventID, EventTitle, EventDescription, EventStartTime,
               EventEndTime, EventCapacity, EventStatus, EventVisibility
        FROM event
        WHERE EventID = %s
    """, (event_id,))
    event = cur.fetchone()

    cur.close()
    return render_template('edit_event.html', event=event)


# delete event
@app.route('/delete_event/<event_id>', methods=['POST'])
def delete_event(event_id):
    cur = mysql.connection.cursor()

    cur.execute("DELETE FROM attendance WHERE EventID = %s", (event_id,))
    cur.execute("DELETE FROM rsvp WHERE EventID = %s", (event_id,))
    cur.execute("DELETE FROM event WHERE EventID = %s", (event_id,))

    mysql.connection.commit()
    cur.close()

    return redirect(url_for('events'))


if __name__ == '__main__':
    app.run(debug=True)
