const AUDIO_DATA_DELETE = """
	mutation AudioDataDelete (
		\$id: uuid!
	) {
		delete_audio_datas (
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