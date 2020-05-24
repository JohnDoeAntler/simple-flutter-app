const GET_IMAGE_DATAS = """
	query GetImageDatas (
		\$id: uuid!
	) {
		image_datas (
			where: {
				workId: {
					_eq: \$id
				}
			}
		) {
			id
			fileUrl
			created_at
			updated_at
		}
	}
""";
