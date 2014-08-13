
describe 'homepage', ->
  it 'should have a title', ->
    browser.get('http://localhost:9002/')
    expect(browser.getTitle()).toEqual('Sample app')
