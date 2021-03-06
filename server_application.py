# -*- coding: utf-8 -*-

"""
@author: zhangqian

@contact: 

@Created on: 2020-07-31 07:55
"""

from flask import Flask, render_template, request
from main import handle_question

app = Flask(__name__)


@app.route('/', methods=["GET"])
def index():
    return render_template("index.html")


@app.route('/question', methods=["POST", "GET"])
def get_question():
    question = request.values.get("message")
    print("question:{}".format(question))
    if (question is None) or (question is ""):
        return "问题不能为空"
    result_answer = handle_question(question)
    result_data = {"data": "{}".format(result_answer)}
    return result_data


if __name__ == '__main__':
    app.run(host="0.0.0.0", debug=True, port=8001)
