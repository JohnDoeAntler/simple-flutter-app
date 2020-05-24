const GET_PROGRESSES = """
	query GetProgresses(
		\$id: String!
	) {
		progresses(
			where: {
				userId: {
					_eq: \$id
				}
			}
		) {
			id
			progress
			drivingVideoUrl
			resultUrl
			isProcessing
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
			created_at
			updated_at
		}
	}
""";