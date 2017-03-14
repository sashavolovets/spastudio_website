# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'click', '#newPriceTag', (e) ->
  e.preventDefault()
  id = parseInt($(".price-tag").last().attr('id')) + 1;

  html = '<form class="form-inline price-tag" action="/services/' + $(this).attr('data-service-id') + '/price_tags" id="' + id + '" accept-charset="UTF-8" data-remote="true" method="post">
          <input name="utf8" type="hidden" value="✓">
          <input name="old_id" type="hidden" value="' + id + '">
          <input type="hidden" name="_method" value="post">
          <input type="text" name="price_tag[tag]" id="price_tag_tag" value="" class="form-control" placeholder="Название">
          <input type="text" name="price_tag[min_price]" id="price_tag_price" value="" class="form-control" placeholder="Цена (от)">
          <input type="text" name="price_tag[max_price]" id="price_tag_price" value="" class="form-control" placeholder="Цена (до)">
          <input type="submit" name="commit" value="Сохранить" class="btn btn-default" data-disable-with="Сохранить">
          <a style="margin-top: -10px" class="btn btn-default remove-pt" data-remote="true" rel="nofollow" data-method="delete">Удалить</a>
          </form>'
  $('.prices-container').append(html)
  return

$(document).on 'click', '.remove-pt', (e) ->
  e.preventDefault()
  $(this).parent().remove()
  return
