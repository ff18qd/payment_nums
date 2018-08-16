# payment_nums
Ruby algorithm to generate 10 digit numbers and save in the excel file


We would like to improve our service by making sure that this PRN at least does not contain X same digits
in a row. This is a common reason for typos, and makes it hard to convey the number over the telephone,
e.g. when talking to a call centre. For example, we would like to avoid issuing payment numbers that look
like this:
- With X=3: 1233345678
- With X=4: 1222234567
We want you to build an algorithm, that for any given, sensible X would be able to find a payment number
that does not expose a repeating digit of length X. This solution should be efficient and perform well when
there are already a lot of existing payment numbers. For this challenge, we’re providing you with a CSV-file
containing a list of already existing payment numbers (where X=4). Your task is to come up with new PRNs
which do not yet exist and add them to this file.
Some more practical requirements:
- Your solution should come in a single file.
- Please provide tests for your code. The tests should run when that file is executed. No need to
use rspec, minitest or the like, just define some examples that provide sufficient test
coverage.
- Your solution should not use any gems and work with the Ruby 2.0 (or newer) core API
- Please don’t just try random numbers but consider performance in your solution
- Please add some comments to illustrate your considerations to a fellow developer
- Bonus: Encapsulate your solution in a class or module to be reused in other code-bases
