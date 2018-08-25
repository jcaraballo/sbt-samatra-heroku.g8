# Giter8 template: Scala SBT Samatra Heroku

Minimal template to deploy a [Samatra](https://github.com/springernature/samatra) app 
in Heroku.


## Requirements
You'll need git, sbt, the Heroku client and a Heroku account. For Debian/Ubuntu 
you can install Heroku client with

    sudo add-apt-repository "deb https://cli-assets.heroku.com/branches/stable/apt ./"
    curl -L https://cli-assets.heroku.com/apt/release.key | sudo apt-key add -
    sudo apt-get update
    sudo apt-get install heroku

(more in https://devcenter.heroku.com/articles/getting-started-with-scala)

## Usage
Use with
```
sbt new jcaraballo/sbt-samatra-heroku.g8
```

Then add to git
```
cd <name-of-the-project>
git init
git add * .gitignore
git commit -m 'Initial commit from g8 template'
```

And deploy to Heroku
```
heroku login
heroku create
git push heroku master
```

That's it. The output of the deployment triggered by `git push` should have finished with 
```
https://<heroku-app-name>.herokuapp.com/ deployed to Heroku
[...]
```

Where you can now go and use the app.

---

You will probably also want to push it to your own repository. E.g. in GitHub:
```
git remote add origin git@github.com:<github-user>/<name-of-the-project>.git
git push -u origin master
```

So you can work from a different machine
```
git clone git@github.com:<github-user>/<name-of-the-project>.git
cd <name-of-the-project>
git remote add heroku https://git.heroku.com/<heroku-app-name>.git
```

(`heroku apps` might help if you can't remember the name that Heroku assigned to the app)

Push changes to your origin as you would normally do with `git push`. Then redeploy to Heroku
with
```
git push heroku master
```

##  Developing this template

### Additional requirements
Requires docker

### Clone it and try it from your own git working copy
```
git clone https://github.com/jcaraballo/sbt-samatra-heroku.g8
sbt new file://sbt-samatra-heroku.g8
```
(note that here `sbt-samatra-heroku.g8` is the relative path to your directory with the cloned repository of the template.)

### Test the template
```
docker build -t sbt-samatra-heroku.g8 . && docker run sbt-samatra-heroku.g8
```

