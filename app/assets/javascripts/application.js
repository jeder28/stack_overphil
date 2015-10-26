// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {
  $('.side-btns').on('click', '[btn-id="vote-sort"]', function(e){
    e.preventDefault();
    var $btnPath = $(this).find('a');
    var url = $btnPath.attr('href');
    $.ajax({
      type: 'GET',
      url: url
    }).then(function(response){
      $('.ques-list').replaceWith(response);
    }).fail(function(){alert('Oops, something went wrong. Please contact the system administrator.')});
  })

    $('.side-btns').on('click', '[btn-id="trendy-sort"]', function(e){
    e.preventDefault();
    var $btnPath = $(this).find('a');
    var url = $btnPath.attr('href');
    $.ajax({
      type: 'GET',
      url: url
    }).then(function(response){
      $('.ques-list').replaceWith(response);
    }).fail(function(){alert('Oops, something went wrong. Please contact the system administrator.')});
  })

    $('.side-btns').on('click', '[btn-id="recent-sort"]', function(e){
    e.preventDefault();
    var $btnPath = $(this).find('a');
    var url = $btnPath.attr('href');
    $.ajax({
      type: 'GET',
      url: url
    }).then(function(response){
      $('.ques-list').replaceWith(response);
    }).fail(function(){alert('Oops, something went wrong. Please contact the system administrator.')});
  })

    $('.vote-table').on('submit', '.upvote', function(e){
      e.preventDefault();
      voteTableBody = $(this).parent().parent().parent();
      var type = $(this).attr('method');
      var url = $(this).attr('action');
      var data = $(this).serialize();
      $.ajax({
        type: type,
        url: url,
        data: data
      }).done(function(response){
        debugger
        voteTableBody.replaceWith(response);
      }).fail(function(){alert('Oops, something went wrong. Please contact the system administrator.')});
    })

    $('.vote-table').on('submit', '.downvote', function(e){
      e.preventDefault();
      voteTableBody = $(this).parent().parent().parent();
      var type = $(this).attr('method');
      var url = $(this).attr('action');
      var data = $(this).serialize();
      $.ajax({
        type: type,
        url: url,
        data: data
      }).done(function(response){
        voteTableBody.replaceWith(response);
      }).fail(function(){alert('Oops, something went wrong. Please contact the system administrator.')});
    })

})