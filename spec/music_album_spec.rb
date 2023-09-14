require_relative '../music_album'
require 'rspec'

describe MusicAlbum do
  context 'when adding a music album' do
    # Arrange
    let(:album) { MusicAlbum.new(publish_date: '01/01/2020', on_spotify: true) }
    let(:album2) { MusicAlbum.new(publish_date: '01/01/2010', on_spotify: true) }

    it 'should have correct attributes and be an instance of MusicAlbum' do
      # Act
      on_spotify = album.on_spotify
      date = album.publish_date

      # Assert
      expect(album).to be_an_instance_of(MusicAlbum)
      expect(on_spotify).to eq(true)
      expect(date).to eq('01/01/2020')
    end

    it 'should be archivable when on Spotify, and if published_date is older than 10 years' do
      # Act
      archivable = album2.send(:can_be_archived?)
      # Assert
      expect(archivable).to be(true)
    end
  end
end
