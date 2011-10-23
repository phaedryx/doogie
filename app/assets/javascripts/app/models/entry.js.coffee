class App.Entry extends Spine.Model
  @configure 'Entry', 'written_on', 'content'
  @extend Spine.Model.Ajax
  @url: '/entries'