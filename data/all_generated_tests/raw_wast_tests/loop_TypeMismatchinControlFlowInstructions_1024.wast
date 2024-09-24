;; 5. Construct a `loop` with an incorrect block type, where the declared blocktype assumes a vector of types `[i32, f32] -> []` but the loop instructions only correctly handle a single type `[i32] -> []`.

(assert_invalid
  (module (func $incorrect-blocktype
    (loop (result i32 f32) (i32.const 0) (drop))
  ))
  "type mismatch"
)