USE management_books;

INSERT INTO abilities (get_bln,edit_bln,create_bln,delete_bln) VALUES
  (TRUE,TRUE,TRUE,TRUE),
  (TRUE,TRUE,TRUE,FALSE),
  (TRUE,TRUE,FALSE,FALSE),
  (TRUE,FALSE,FALSE,FALSE)
;

INSERT INTO roles (name) VALUES
  ('admin'),
  ('superuser'),
  ('user'),
  ('guest')
;

INSERT INTO role_ability (role_id,ability_id,updated_by) VALUES
  (1,1,'admin'),
  (2,2,'admin'),
  (3,3,'admin'),
  (4,4,'admin')
;

INSERT INTO company (name,updated_by) VALUES
  ('VRST','admin'),
  ('Amplity','admin')
;

INSERT INTO department (name,updated_by) VALUES
  ('事業所・本部','admin'),
  ('営業','admin'),
  ('フロントエンド','admin'),
  ('バックエンド','admin'),
  ('インフラストラクチャ','admin')
;

INSERT INTO mst_users (name,email,password,company_id,department_id,role_id,updated_by) VALUES
  ('admin','test@email.com','admin',1,1,1,'admin'),
  ('testUser','test@email.com','testUser',1,1,3,'admin'),
  ('guest','test@email.com','guest',1,1,4,'admin')
;

INSERT INTO mst_books (title,summary,image_path,updated_by) VALUES
  ('Spring徹底入門','Spring FrameworkによるJavaアプリケーション開発','img/default.png','admin'),
  ('スッキリわかるJava入門 第3版','本書は、初学者がよくつまずくポイントや疑問点に対して、著者が、実際に手がけた開発プロジェクト現場での体験や、多くの生徒を指南してきた研修での講師経験をもとに、いろいろな角度から具体的で的確なアドバイスを行っているため、まだ腑に落ちていないのに勝手にストーリーが進むということがなく、一歩一歩着実に理解を深めて、無駄なく短期間で知識を習得できる構成になっています。','img/default.png','admin'),
  ('リーダブルコード','より良いコードを書くためのシンプルで実践的なテクニック (Theory in practice)','img/default.png','admin')
;

INSERT INTO txn_category (book_id,category,updated_by) VALUES
  (1,'Web開発','admin'),
  (2,'Web開発','admin'),
  (3,'Web開発','admin')
;

INSERT INTO txn_detail (book_id,detail,updated_by) VALUES
  (1,'Java','admin'),
  (1,'Spring','admin'),
  (2,'Java','admin'),
  (2,'初心者','admin'),
  (3,'プログラミング','admin'),
  (3,'チーム開発','admin')
;

INSERT INTO mst_stocks (book_id,quantity,updated_by) VALUES
  (1,7,'admin'),
  (2,4,'admin'),
  (3,1,'admin')
;

INSERT INTO process_type (type) VALUES
  ('在庫あり'),
  ('在庫切れ'),
  ('貸出中'),
  ('返却済'),
  ('予約')
;

INSERT INTO txn_stock (stock_id,process_id) VALUES
  (1,3),
  (1,1),
  (1,1),
  (1,1),
  (1,1),
  (1,1),
  (1,1),
  (2,1),
  (2,1),
  (2,1),
  (2,1),
  (3,1)
;

INSERT INTO mst_rent (user_id,txn_stock_id,rent_at,return_at) VALUES
  (2,1,'2022-10-30','2022-11-30')
;

INSERT INTO txn_rent (rent_id,process_id,updated_by) VALUES
  (1,3,'testUser')
;
