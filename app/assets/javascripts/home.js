// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require turbolinks
//= require moment
//= require fullcalendar
//= require fullcalendar/lang/ja
//= require_tree .
$(document).on('turbolinks:load', function() {

    //トークン生成
  var prepare = function(options, originalOptions, jqXHR) {
      var token;
      if (!options.crossDomain) {
        token = $('meta[name="csrf-token"]').attr('content');
        if (token) {
          return jqXHR.setRequestHeader('X-CSRF-Token', token);
        }
      }
    };
      //イベント追加
  create_event = function(title, start, end) {
    $.ajaxPrefilter(prepare);
    $.ajax({
      type: "post",
      url: "/home/create_event",
      dataType: 'json',
      data: {
        title: title,
        start: start.toISOString(),
        end: end.toISOString(),
      }
    }).done(function(data) {
      alert("登録しました!");
    }).fail(function(data) {
      alert("登録できませんでした。");
    });
  };

    //イベント更新
  update_event = function(id, title, start, end){
     $.ajaxPrefilter(prepare);
     $.ajax({
       type: "post",
       url: '/home/update_event',
       dataType: 'json',
       data: {
         id: id,
         title: title,
         start: start.toISOString(),
         end: end.toISOString()
       }
     }).done(function(data){
       alert("更新しました!");
     }).fail(function(data){
       alert("更新できませんでした。");
     });
   };

    //イベント削除
   remove_event = function(id,title){
      $.ajaxPrefilter(prepare);
      $.ajax({
        type: "post",
        url: '/home/remove_event',
        dataType: 'json',
        data: {
          id: id,
          title: title
        }
      }).done(function(data){
        alert("更新しました!");
      }).fail(function(data){
        alert("更新できませんでした。");
      });
    };


  $('#calendar').fullCalendar({
    navLinks: true,
    selectable: true,
    selectHelper: true,

      //新規イベント追加
    select: function(start, end, allDay) {
      var title = prompt('タイトルを入力してください');
      if (!allDay) {
        $('#calendar').fullCalendar('renderEvent', {
          title: title,
          start: start,
          end: end,
          color: 'pink',
          allDay: false
        });
      } else {
        $('#calendar').fullCalendar('renderEvent', {
          title: title,
          start: start,
          end: end,
          color: 'red',
          allDay: allDay
        });
      };
      $('#calendar').fullCalendar('unselect');
      create_event(title, start, end);
    },

      //イベント訂正
    eventClick: function(event, jsEvent) {
      var title = prompt('予定を変更');
      if(title == "削除"){
      event.title = title;
      remove_event(event.id,title);
      calendar.fullCalendar("removeEvents", event.id); //イベント（予定）の削除
    }else{
        event.title = title;
        $('#calendar').fullCalendar('updateEvent', event); //イベント（予定）の修正
        update_event(event.id, title, event.start, event.end);
      }
    },

    timezone: 'UTC',
    events: '/plans.json',
    editable: true,
  })
});

$(document).on('turbolinks:before-cache', function() {
  $('#calendar').empty()({})
});
