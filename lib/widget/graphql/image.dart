const IMAGE_DATA_DELETE = """
	mutation ImageDataDelete (
		\$id: uuid!
	) {
		delete_image_datas (
			where: {
				id: {
					_eq: \$id
				}
			}
		) {
			affected_rows
		}
	}
""";