var gulp = require('gulp');
var shell = require('gulp-shell');
var mkdirp = require('mkdirp');

gulp.task('create-bin', function() {
    mkdirp('bin/js');
});

gulp.task('build-js', shell.task('haxe targets/js.hxml'));

gulp.task('build', ['create-bin', 'build-js']);

gulp.task('test', shell.task('haxelib run munit test'));

gulp.task('watch', function() {
    gulp.watch(['src/**/*.hx', 'test/**/*.hx'], ['test']);
});
