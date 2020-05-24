const GET_USERS = """
	query GetUsers (
		\$filter: String
	) {
		users (
			where: {
				name: {
					_ilike: \$filter
				}
			}
		) {
			id
			name
			imageUrl
			followers_aggregate {
				aggregate {
					count
				}
			}
			
			followings_aggregate {
				aggregate {
					count
				}
			}
			works_aggregate {
				aggregate {
					count
				}
			} 
			
			created_at
			updated_at
		}
	}
""";

const GET_USER_DETAIL = """
	query GetUserDetail (
		\$id: String!
	) {
		users_by_pk (
			id: \$id
		) {
			id
			name
			imageUrl
			created_at
			updated_at
			
			followers_aggregate {
				aggregate {
					count
				}
			}
			
			followings_aggregate {
				aggregate {
					count
				}
			}
			
			works {
				id
				name
				description
				imageUrl
				views
				usage
				
				created_at
				updated_at
			}
		}
	}
""";

const USER_EDIT = """
	mutation UserEdit (
		\$id: String!
		\$name: String
		\$imageUrl: String
	) {
		update_users (
			where: {
				id: {
					_eq: \$id
				}
			},
			_set: {
				name: \$name
				imageUrl: \$imageUrl
			}
		) {
			returning {
				id
			}
		}
	}
""";