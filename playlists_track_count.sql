-- playlists_track_count.sql: Provide a query that shows the total number of tracks in each playlist. The Playlist name should be included on the resulant table.

SELECT COUNT(TrackId), Playlist.Name AS PlaylistName
FROM `PlaylistTrack`
JOIN Playlist ON PlaylistTrack.PlaylistId = Playlist.PlaylistId
GROUP BY PlaylistTrack.PlaylistId