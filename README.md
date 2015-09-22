Lostmy.name Backend Engineer Technical Test
===========================================

Overview
========
We’re using Mandrill to send our transactional, behavioural and newsletters (via MailChimp). Mandrill provides some analytics tools around email data (e.g. emails sent, open rates, click rates, etc) but these are limited and only based on data from the last month.

We want to use the Mandrill Webhooks to capture email event data in our own data store so that we can perform our own analytics with historical data.

Specification
=============
Implement a web application in Ruby that:
* can receive webhooks from Mandrill
* processes the webhook data and stores it into a suitable data store
* displays the following statistics:
  - total number of emails sent
  - total number of emails opened
  - total number of clicks
  - open rate per email type
  - click rate per email type

You can use any Ruby frameworks/libraries/gems of your choice, and data store of your choice.

Sample data
===========
Here are some example payloads:

{"Address":"barney@lostmy.name","EmailType":"Shipment","Event":"send","Timestamp":1432820696}
{"Address":"tom@lostmy.name","EmailType":"UserConfirmation","Event":"click","Timestamp":1432820702}
{"Address":"vitor@lostmy.name","EmailType":"Shipment","Event":"open","Timestamp":1432820704}

We’ve implemented a small command line tool that will generate sample data and post it to a URL, e.g.:
$ ./llirdnam http://localhost:4000

For the scope of the exercise, please just use the sample data generator - don’t worry about using real Mandrill data.

You can download the file here:
https://drive.google.com/open?id=0B5VIckaaxs_wZU1XLUFkcG9IWm8
