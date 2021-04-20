import ApplicationController from './application_controller'
import SlimSelect from 'slim-select'

export default class extends ApplicationController {
  static values = {
    limit: Number,
    placeholder: String,
    searchText: String,
    searchingText: String,
    reflex: String,
    showSearch: Boolean
  }

  connect () {
    super.connect()
    const closeOnSelect = this.single
    const allowDeselect = !this.element.required

    this.select = new SlimSelect({
      select: this.element,
      closeOnSelect,
      allowDeselect,
      limit: this.limitValue,
      showSearch: this.hasShowSearchValue ? this.showSearchValue : true,
      placeholder: this.hasPlaceholderValue
        ? this.placeholderValue
        : 'Select Value',
      searchText: this.hasSearchTextValue ? this.searchTextValue : 'No Results',
      searchingText: this.hasSearchingTextValue
        ? this.searchingTextValue
        : 'Searching...',
      ajax: this.hasReflexValue ? this.search : () => {},
      onChange: this.onChange
    })
  }

  search = (search, callback) =>
    this.stimulate(this.reflexValue, search).then(({ payload }) =>
      callback(payload)
    )

  onChange = () => {
    if (!this.select.data.searchValue) return
    if (this.select.selected() === undefined)
      this.stimulate(this.reflexValue, '')
  }

  get single () {
    return !this.element.multiple
  }
  get multi () {
    return this.element.multiple
  }

  disconnect () {
    this.select.destroy()
    if (this.hasReflexValue) document.removeEventListener('data', this.results)
  }
}
