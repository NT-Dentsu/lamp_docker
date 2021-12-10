#Rev 1.3 panel_nameとpanel_sizeのNULLを許可、主キーを変更
#Rev 1.2 panel_sizeカラムのデフォルト値を設定
#Rev 1.1 テーブル名の前にDB名を追加
#Rev 1.0 新規作成
USE dentsudb;

CREATE TABLE IF NOT EXISTS dentsudb.t_user_panel_info(
    user_id VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    panel_name VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_bin,
    anchor_num SMALLINT UNSIGNED NOT NULL,
    panel_size TINYINT UNSIGNED DEFAULT 5,
    PRIMARY KEY(
        user_id,
        anchor_num
    )
)
;
