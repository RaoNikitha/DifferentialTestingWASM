;; 2. **Test Missing End for Block**: Introduce a block instruction without an accompanying `end` keyword, to see if one implementation improperly handles or incompletely exits, leading to an infinite loop.

(assert_malformed
  (module (func $missing-end-for-block (result i32)
    (block (result i32) (i32.const 1))
  ))
  "unexpected end of section or function"
)