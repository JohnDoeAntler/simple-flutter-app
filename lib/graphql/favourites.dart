const GET_FAVOURITES = """
	query GetFavourites (
		\$id: String!
		\$filter: String!
	) {
		favourites (
			where: {
				_and: {
					userId: {
						_eq: \$id
					},
					work: {
						_or: [
							{
								name: {
									_ilike: \$filter
								},
							}, {
								description: {
									_ilike: \$filter
								}
							}
						]
					}
				}
			}
		) {
			work {
				id
				name
				description
				imageUrl
				likes_aggregate {
					aggregate {
						count
					}
				}
				favourites_aggregate {
					aggregate {
						count
					}
				}
				views
				usage
				created_at
				updated_at
			}
		}
	}
""";