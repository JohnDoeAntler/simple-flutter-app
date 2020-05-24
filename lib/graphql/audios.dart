const GET_AUDIO_DATAS = """
	query GetAudioDatas (
		\$id: uuid!
	) {
		audio_datas (
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