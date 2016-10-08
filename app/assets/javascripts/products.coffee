$ ->
  update_attachment_ids = (attachment_id) ->
    # Get value as string from input
    rejected_ids = $('#rejected_ids').val() or '[]'
    # Parse string to array
    rejected_ids = $.parseJSON(rejected_ids)
    # Push id to array
    rejected_ids.push parseInt(attachment_id)
    # Set value as string back to input
    $('#rejected_ids').val JSON.stringify(rejected_ids)

  $(".remove_thumb").on "click", ->
    block = $(this).parent().parent()
    update_attachment_ids block.attr('id')
    block.fadeOut()
    block.remove()
    if $('#preview-wrapper .dz-preview').length == 0
        $('#submit-btn').attr 'disabled', true