INSERT INTO arcachon.mime_type
(
  mime_type_id,
  content_type,
  extension
)
VALUES
(
  2,
  'application/zip',
  'zip'
);

INSERT INTO arcachon.mime_type
(
  mime_type_id,
  content_type,
  extension
)
VALUES
(
  3,
  'audio/mpeg',
  'mp3'
);

INSERT INTO arcachon.mime_type
(
  mime_type_id,
  content_type,
  extension
)
VALUES
(
  4,
  'image/jpeg',
  'jpg'
);

INSERT INTO arcachon.mime_type
(
  mime_type_id,
  content_type,
  extension
)
VALUES
(
  5,
  'image/jpeg',
  'jpeg'
);

INSERT INTO arcachon.mime_type
(
  mime_type_id,
  content_type,
  extension
)
VALUES
(
  6,
  'image/png',
  'png'
);

INSERT INTO arcachon.mime_type
(
  mime_type_id,
  content_type,
  extension
)
VALUES
(
  7,
  'image/tiff',
  'tiff'
);

INSERT INTO arcachon.mime_type
(
  mime_type_id,
  content_type,
  extension
)
VALUES
(
  9,
  'application/vnd.oasis.opendocument.text',
  'odt'
);

INSERT INTO arcachon.mime_type
(
  mime_type_id,
  content_type,
  extension
)
VALUES
(
  10,
  'application/vnd.oasis.opendocument.spreadsheet',
  'ods'
);

INSERT INTO arcachon.mime_type
(
  mime_type_id,
  content_type,
  extension
)
VALUES
(
  11,
  'application/vnd.ms-excel',
  'xls'
);

INSERT INTO arcachon.mime_type
(
  mime_type_id,
  content_type,
  extension
)
VALUES
(
  12,
  'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
  'xlsx'
);

INSERT INTO arcachon.mime_type
(
  mime_type_id,
  content_type,
  extension
)
VALUES
(
  13,
  'application/msword',
  'doc'
);

INSERT INTO arcachon.mime_type
(
  mime_type_id,
  content_type,
  extension
)
VALUES
(
  14,
  'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
  'docx'
);

INSERT INTO arcachon.mime_type
(
  mime_type_id,
  content_type,
  extension
)
VALUES
(
  8,
  'text/csv',
  'csv'
);

INSERT INTO arcachon.mime_type(  mime_type_id,  content_type,  extension)
 VALUES
 (  1,  'application/pdf',  'pdf');

select setval('arcachon.mime_type_mime_type_id_seq', (select max(mime_type_id) from arcachon.mime_type));
