# UpcomingMovies
App prototype for cinephiles and movie hobbyists.

## Project Generation
We're using [Tuist](https://docs.tuist.io/tutorial/get-started) command line tool to facilitate the project's generation.
To install tuist run the following command in your terminal:
```
curl -Ls https://install.tuist.io | bash
```
To generate the project you just have to run the following command from the project root directory:
```
tuist generate
```

## Dependency Manager
We're using [Swift Package Manager](https://www.swift.org/package-manager/) the dependency manager, however since [Tuist](https://tuist.io/) is used to generate the project, in order to fetch the dependencies you might need to run the following command from the project root directory:
```
tuist fetch
```

### Libraries
+ [SnapKit](https://github.com/SnapKit/SnapKit) A Swift Autolayout DSL for iOS & OS X.
+ [Kingfisher](https://github.com/onevcat/Kingfisher) A lightweight, pure-Swift library for downloading and caching images from the web.

## Copyright
* Copyright (C) 2019 Open Source Matters. All rights reserved.
* Distributed under the GNU General Public License version 3 or later. Read [License details](LICENSE.md) or see <https://www.gnu.org/licenses/>.


## Preview

|   Launch Screen   |    Movie Details    | Search Movies | Upcoming Movies |
|-------------------|---------------------|---------------|-----------------|
| ![um_launchscreen](https://user-images.githubusercontent.com/1212083/52572222-4f238780-2de5-11e9-93f1-103e87f2d39c.png) | ![um_moviedetails](https://user-images.githubusercontent.com/1212083/52572223-4f238780-2de5-11e9-8896-1035ebc46c6d.png) | ![um_searchmovies](https://user-images.githubusercontent.com/1212083/52572224-4f238780-2de5-11e9-8be9-327e2fd1e80f.png) | ![um_upcomingmovies](https://user-images.githubusercontent.com/1212083/52572226-4f238780-2de5-11e9-8bd7-f96fdf9ba82a.png) |
