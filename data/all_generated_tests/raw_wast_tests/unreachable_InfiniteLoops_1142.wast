;; Test 3: Use an infinite loop with multiple `br_if` instructions interleaved with `unreachable`, where condition evaluation should break out of the loop but fails to do so.

(assert_invalid
  (module (func $type-loop-unreachable-with-br-if (loop (br_if 0 (i32.const 0)) unreachable))
  )
  "type mismatch"
)