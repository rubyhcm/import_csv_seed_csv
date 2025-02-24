#### Import csv

Install gem "activerecord-import"

```ruby
# For import a model
# /home/nguyenloi/Desktop/telegram_ai/app/services/csv_me.rb

# For import with model asociation
# /home/nguyenloi/Desktop/telegram_ai/lib/tasks/import_csv.rake
```

#### Test

`rake import_csv:posts`

#### Seed from csv

You can move codes from import_csv.rake to seeds.rb to run
