# Fran Planner

## Preview

Check out what this application looks like!

http://hrobeers.github.io/fran-planner-html/

## Running the html demo app:

1. git clone https://github.com/hrobeers/fran-planner-html.git
2. cd fran-planner-html
3. python -m http.server

## Running entire Phoenix app:

1. Install Elixir
2. Install dependencies with `mix deps.get`
3. Configure your postgres db and update config/dev.exs
4. Start Phoenix endpoint with `mix phoenix.server`
   Now you can visit `localhost:4000` from your browser.
5. Add moments using the Json API:

   POST to localhost:4000/api/moments

   ```javascript
   {
    "moment":
      {
        "starttime": "18:00:00",
        "endtime": "20:00:00",
        "date": "2015-08-01",
        "location": "Somewhere",
        "max_count": 5
      }
   }
   ```
6. Give birth!