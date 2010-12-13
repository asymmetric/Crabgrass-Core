SearchFilter.new('/watched-by-me/') do

  mysql do |query, id|
    query.add_sql_condition(
      'user_participations.user_id = ? AND user_participations.watch',
      query.current_user.id
    )
  end

  # TODO: we don't have a multi attribute for 'watched_by_ids'
  #sphinx do |query, id|
  #  query.add_attribute_constraint(:watched_by_ids, user_id(id))
  #end

  #
  # ui
  #
 
  self.singleton = true
  self.section = :my_pages
  self.label   = :watched_by_me

end

