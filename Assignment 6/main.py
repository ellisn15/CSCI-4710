import os
from flask import Flask, request, render_template
from werkzeug.utils import secure_filename
import util

# get current app directory
dir_path = os.path.dirname(os.path.realpath(__file__))
UPLOAD_FOLDER = dir_path + '/data/'

app = Flask(__name__)
app.config['DATA_FILE'] = UPLOAD_FOLDER + 'NRDC_data.csv'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
app.config['COL_NAMES'] = []
app.config['META_FILE'] = UPLOAD_FOLDER + 'meta_data.txt'

@app.route('/api/post_csv', methods=['POST'])
def post_csv():
	# request.file <class 'werkzeug.datastructures.FileStorage'>
	# request.url is http://127.0.0.1:5000/
	# check if the post request has the file part
    if 'file' not in request.files:
        log = 'no file field in request.'
        return render_template('fail.html', log = log)
	# print(request.files['file'])
    file = request.files['file']
	# if user does not select file, browser also
	# submit an empty part without filename
    if file.filename == '':
        log = 'Empty filename.'
        return render_template('fail.html', log = log)
    if file and util.allowed_file(file.filename):
		# get filename in a safe way
        filename = secure_filename(file.filename)
		# check if the data folder exists, if not create one
        if os.path.exists(app.config['UPLOAD_FOLDER']) == False:
            os.makedirs(app.config['UPLOAD_FOLDER'])
        file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
        column_names, data_part = util.preview_csv(app.config['UPLOAD_FOLDER']+filename)
        app.config['COL_NAMES'] = column_names
        return render_template('success.html',column_names=column_names, data_part=data_part)

@app.route('/api/process_csv/<col_name>/<lower_threshold>/<upper_threshold>')
def process_csv(col_name='', lower_threshold='', upper_threshold=''):
    qualified, outlier = util.threshold_process_method(app.config['DATA_FILE'], app.config['COL_NAMES'][app.config['COL_NAMES'].index(col_name)], float(lower_threshold), float(upper_threshold))
	# print(qualified)
    return qualified

@app.route('/api/save_meta', methods=['POST'])
def save_meta():
	input_values = request.form
	result_str = 'First Name:' + request.form['first_name'] + '\n' + \
				 'Last Name:' + request.form['last_name'] + '\n' + \
				 'Email:' + request.form['email']
	# print(result_str)
	text_file = open(app.config['META_FILE'], "w")
	text_file.write(result_str)
	text_file.close()
	return render_template('success.html')

@app.route('/save_meta', methods=['GET', 'POST'])
def meta():
    return render_template('save_meta.html')

@app.route('/run_tests')
def run_tests():
    return render_template('run_tests.html')

@app.route('/review')
def review():
    return render_template('review.html')

@app.route('/', methods=['GET', 'POST'])
def upload_files():
    return render_template('upload.html')

if __name__ == '__main__':
    app.debug = True
    ip = '127.0.0.1'
    app.run(host=ip)