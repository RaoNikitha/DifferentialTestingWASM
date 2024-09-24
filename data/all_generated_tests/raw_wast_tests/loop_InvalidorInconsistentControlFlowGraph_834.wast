;; 5. Devise a loop instruction that is followed by unreachable code outside the loop, checking if the implementation correctly identifies and handles unreachable code paths.

(assert_invalid
  (module (func $unreachable-code
    (loop (result i32)
      (i32.const 0)
      (br 1)
    )
    (unreachable)
  ))
  "type mismatch"
)