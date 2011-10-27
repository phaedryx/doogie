class App.Entry extends Spine.Model
  @configure 'Entry', 'year', 'month', 'day', 'content'
  @extend Spine.Model.Ajax
  @url: '/entries'