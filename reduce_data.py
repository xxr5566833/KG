import json
import sys
def rewrite(src, count):
    datas = []
    i = 0
    with open(src, "r") as f:
        line = f.readline()
        while line:
            line = line.replace("\n", "")
            data = json.loads(line)
            datas.append(data)
            i += 1
            if(i >= count):
                break
            line = f.readline()
    with open(src, "w") as f:
        for data in datas:
            s = json.dumps(data)
            f.write(s + "\n")

if __name__ == "__main__":
    count = 1000
    if(sys.platform=="win32"):
        train_src = r"F:\myrepo\deep-keyphrase\data\raw\kp20k_new\kp20k_training.json"
    else:
        train_src = "/home/xiaorui/myrepo/deep-keyphrase/data/raw/kp20k_new/kp20k_training.json"
    rewrite(train_src, count)
    count = 100
    if (sys.platform == "win32"):
        test_src = r"F:\myrepo\deep-keyphrase\data\raw\kp20k_new\kp20k_testing.json"
    else:
        test_src = "/home/xiaorui/myrepo/deep-keyphrase/data/raw/kp20k_new/kp20k_testing.json"
    rewrite(test_src, count)
    count = 100
    if (sys.platform == "win32"):
        valid_src = r"F:\myrepo\deep-keyphrase\data\raw\kp20k_new\kp20k_validation.json"
    else:
        valid_src = "/home/xiaorui/myrepo/deep-keyphrase/data/raw/kp20k_new/kp20k_validation.json"
    rewrite(valid_src, count)
