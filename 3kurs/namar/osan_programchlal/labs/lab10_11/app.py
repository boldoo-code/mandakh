from flask import Flask, render_template
from neo4j import GraphDatabase
import os

app = Flask(__name__)


MOVIE_IMG = os.path.join('static', 'movies')

app.config['UPLOAD_FOLDER'] = MOVIE_IMG
file_path = os.path.join(app.config['UPLOAD_FOLDER'], 'bold')



URI = 'bolt://localhost:7687'
AUTH = ('neo4j', 'admin123')


def get_driver():
    return GraphDatabase.driver(uri=URI, auth=AUTH)


@app.route('/')
def index():
    with get_driver() as driver:
        driver.verify_connectivity()
        records, summary, keys = driver.execute_query(
            "match(m:Movie) return m.title as title, m.released as released, m.image as image, m.tagline as tagline limit 6"
        )
    return render_template('base.html', data=records)
# index


@app.route('/movies')
def movies():
    with get_driver() as driver:
        driver.verify_connectivity()
        records, summary, keys = driver.execute_query(
            "match(m:Movie) return m.title as title, m.released as released, m.image as image, m.tagline as tagline limit 20"
        )
    return render_template('movies.html', data=records)
# movies


@app.route('/director')
def director():
    with get_driver() as driver:
        driver.verify_connectivity()
        records, summary, keys = driver.execute_query(
            "match(p:Person)-[r:DIRECTED]-() return distinct p.name as name, p.born as born"
        )
    return render_template('director.html', data=records)
# director


@app.route('/writer')
def writer():
    with get_driver() as driver:
        driver.verify_connectivity()
        records, summary, keys = driver.execute_query(
            "match(p:Person)-[r:WROTE]-() return distinct p.name as name, p.born as born"
        )
    return render_template('writer.html', data=records)
# writer


@app.route('/acter')
def acter():
    with get_driver() as driver:
        driver.verify_connectivity()
        records, summary, keys = driver.execute_query(
            "match(p:Person)-[r:ACTED_IN]-() return distinct p.name as name, p.born as born"
        )
    return render_template('acter.html', data=records)
# actor


@app.route('/producer')
def producer():
    with get_driver() as driver:
        driver.verify_connectivity()
        records, summary, keys = driver.execute_query(
            "match(p:Person)-[r:PRODUCED]-() return distinct p.name as name, p.born as born"
        )
    return render_template('producer.html', data=records)
# actor


@app.route('/review')
def review():
    with get_driver() as driver:
        driver.verify_connectivity()
        records, summary, keys = driver.execute_query(
            '             match(p:Person)-[r:REVIEWED]-(m:Movie) return distinct p.name as name, r.summary as summary,r.rating as rating, m.title as title'
        )
    return render_template('review.html', data=records)
# review


if __name__ == '__main__':
    app.run(debug=True, port=5001)
