#!/bin/sh

until curl -s http://dynamodb:8000; do
  echo "DynamoDB is not available yet. Retrying in 5 seconds..."
  sleep 5
done

aws dynamodb create-table --table-name user \
  --region ap-northeast-1 \
  --endpoint-url http://dynamodb:8000 \
  --attribute-definitions AttributeName=uuid,AttributeType=S \
  --key-schema AttributeName=uuid,KeyType=HASH \
  --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
  --no-cli-pager;

aws dynamodb batch-write-item \
  --region ap-northeast-1 \
  --endpoint-url http://dynamodb:8000 \
  --request-items '{
    "user": [
      {"PutRequest": {"Item": {"uuid": {"S": "f9f72546-b5b4-8f11-1aaa-71albb80a56e"}, "name": {"S": "Yamada Taro"}}}},
      {"PutRequest": {"Item": {"uuid": {"S": "a9c12546-c5c4-9f22-2bbb-82blcc90b67f"}, "name": {"S": "Suzuki Jiro"}}}},
      {"PutRequest": {"Item": {"uuid": {"S": "b1d23546-d6d5-1f33-3ccc-93cmdde0c78g"}, "name": {"S": "Sato Hanako"}}}},
      {"PutRequest": {"Item": {"uuid": {"S": "c2e34546-e7e6-2g44-4ddd-a4enffe1d89h"}, "name": {"S": "Takahashi Ichiro"}}}},
      {"PutRequest": {"Item": {"uuid": {"S": "d3f45546-f8f7-3h55-5eee-b5fohff2e90i"}, "name": {"S": "Tanaka Saburo"}}}},
      {"PutRequest": {"Item": {"uuid": {"S": "e4g56546-g9g8-4i66-6fff-c6gphgg3f01j"}, "name": {"S": "Nakamura Shizuka"}}}},
      {"PutRequest": {"Item": {"uuid": {"S": "f5h67546-h1h9-5j77-7ggg-d7hqiih4g12k"}, "name": {"S": "Watanabe Tsuyoshi"}}}},
      {"PutRequest": {"Item": {"uuid": {"S": "g6i78546-i2i1-6k88-8hhh-e8irjjh5h23l"}, "name": {"S": "Kobayashi Makoto"}}}},
      {"PutRequest": {"Item": {"uuid": {"S": "h7j89546-j3j2-7l99-9iii-f9jskkj6i34m"}, "name": {"S": "Kato Rina"}}}},
      {"PutRequest": {"Item": {"uuid": {"S": "i8k90546-k4k3-8m00-0jjj-g1ktllk7j45n"}, "name": {"S": "Inoue Yudai"}}}},
      {"PutRequest": {"Item": {"uuid": {"S": "j9l01546-l5l4-9n11-1kkk-h2lulml8k56o"}, "name": {"S": "Matsumoto Akari"}}}},
      {"PutRequest": {"Item": {"uuid": {"S": "k1m12546-m6m5-0o22-2lll-i3mvmnm9l67p"}, "name": {"S": "Ishikawa Koji"}}}},
      {"PutRequest": {"Item": {"uuid": {"S": "l2n23546-n7n6-1p33-3mmm-j4nwnon0m78q"}, "name": {"S": "Aoki Kana"}}}},
      {"PutRequest": {"Item": {"uuid": {"S": "m3o34546-o8o7-2q44-4nnn-k5oxpop1n89r"}, "name": {"S": "Morita Makoto"}}}},
      {"PutRequest": {"Item": {"uuid": {"S": "n4p45546-p9p8-3r55-5ooo-l6pypqp2o90s"}, "name": {"S": "Fujimoto Misaki"}}}},
      {"PutRequest": {"Item": {"uuid": {"S": "o5q56546-q1q9-4s66-6ppp-m7qzqqr3p01t"}, "name": {"S": "Hattori Daisuke"}}}},
      {"PutRequest": {"Item": {"uuid": {"S": "p6r67546-r2r1-5t77-7qqq-n8rarrr4q12u"}, "name": {"S": "Miyamoto Mayu"}}}},
      {"PutRequest": {"Item": {"uuid": {"S": "q7s78546-s3s2-6u88-8rrr-o9sbsst5r23v"}, "name": {"S": "Nagai Kenta"}}}},
      {"PutRequest": {"Item": {"uuid": {"S": "r8t89546-t4t3-7v99-9sss-p1tcttu6s34w"}, "name": {"S": "Sakamoto Nao"}}}},
      {"PutRequest": {"Item": {"uuid": {"S": "s9u90546-u5u4-8w00-0ttt-q2uduvu7t45x"}, "name": {"S": "Sugawara Yuu"}}}},
      {"PutRequest": {"Item": {"uuid": {"S": "t1v01546-v6v5-9x11-1uuu-r3vewvv8u56y"}, "name": {"S": "Murakami Shintaro"}}}},
      {"PutRequest": {"Item": {"uuid": {"S": "u2w12546-w7w6-0y22-2vvv-s4wfxww9v67z"}, "name": {"S": "Kimura Hikari"}}}},
      {"PutRequest": {"Item": {"uuid": {"S": "v3x23546-x8x7-1z33-3www-t5xgyxx0w78a"}, "name": {"S": "Shibata Ryuichi"}}}},
      {"PutRequest": {"Item": {"uuid": {"S": "w4y34546-y9y8-2a44-4xxx-u6yhzyy1x89b"}, "name": {"S": "Honda Yoko"}}}},
      {"PutRequest": {"Item": {"uuid": {"S": "x5z45546-z1z9-3b55-5yyy-v7zizzz2y90c"}, "name": {"S": "Yoshida Naoki"}}}}
    ]
  }'
