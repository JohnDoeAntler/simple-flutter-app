const GET_WORKS = """
	query GetWorks(\$filter: String) {
		works (
			where: {
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
		) {
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
""";

const GET_WORK = """
	query GetWork(
		\$id: uuid!
	) {
		works_by_pk(
			id: \$id
		) {
			name
			description
			imageUrl
			visibility
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
			comments {
				id
				content
				user {
					id
					name
					imageUrl
					created_at
					updated_at
				}
				created_at
				updated_at
			}
			user {
				id
				name
				imageUrl
				created_at
				updated_at
			}
		}
	}
""";

const WORK_NEW = """
	mutation WorkNew (
		\$name: String!
		\$description: String!
		\$imageUrl: String!
		\$visibility: Boolean!
	) {
		insert_works(
			objects: {
				name: \$name,
				description: \$description,
				imageUrl: \$imageUrl,
				visibility: \$visibility
			}
		) {
			returning {
				id
			}
		}
	}
""";

const WORK_EDIT = """
	mutation WorkEdit (
		\$id: uuid!
		\$name: String
		\$description: String
		\$imageUrl: String
		\$visibility: Boolean
	) {
		update_works (
			where: {
				id: {
					_eq: \$id
				}
			}
			_set: {
				name: \$name,
				description: \$description,
				imageUrl: \$imageUrl,
				visibility: \$visibility
			}
		) {
			returning {
				id
			}
		}
	}
""";

const INC_VIEWS = """
	mutation IncViews (
		\$id: uuid!
	) {
		update_works (
			where: {
				id: {
					_eq: \$id
				}
			},
			_inc: {
				views: 1
			}
		) {
			affected_rows
		}
	}
""";