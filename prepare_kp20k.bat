SET ROOT_PATH=%cd%
SET DATA_DIR=%ROOT_PATH%\data
SET SRC_TRAIN=%DATA_DIR%\raw\kp20k_new\kp20k_training.json
SET SRC_VALID=%DATA_DIR%\raw\kp20k_new\kp20k_validation.json
SET SRC_TEST=%DATA_DIR%\raw\kp20k_new\kp20k_testing.json
SET DEST_TRAIN=%DATA_DIR%\kp20k.train.jsonl
SET DEST_VALID=%DATA_DIR%\kp20k.valid.jsonl
SET DEST_TEST=%DATA_DIR%\kp20k.test.jsonl
SET DEST_VOCAB=%DATA_DIR%\vocab_kp20k.txt
:: echo .\deep_keyphrase\data_process\preprocess.py -src_filename %SRC_TRAIN% -dest_filename %DEST_TRAIN% -dest_vocab_path %DEST_VOCAB% -src_lower -target_lower
python ./deep_keyphrase/data_process/preprocess.py -src_filename %SRC_TRAIN% -dest_filename %DEST_TRAIN% -dest_vocab_path %DEST_VOCAB% -src_lower -target_lower
python ./deep_keyphrase/data_process/preprocess.py -src_filename %SRC_VALID% -dest_filename %DEST_VALID% -src_lower -target_lower
python ./deep_keyphrase/data_process/preprocess.py -src_filename %SRC_TEST% -dest_filename %DEST_TEST% -src_lower -target_lower