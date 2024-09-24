;; 6. Implement a loop containing an internal block and an incorrect label reference using `br`. If the branch execution is faulty, it should reach an unreachable instruction, testing the label management of loops and blocks.

(assert_invalid
  (module (func $incorrect-block-label-ref
    (loop $loop (block $block (br $block)) (unreachable))
  ))
  "unknown label"
)