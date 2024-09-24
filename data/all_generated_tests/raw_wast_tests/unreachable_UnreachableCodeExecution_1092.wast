;; 3. Design a `block` statement that nested deeper within intentionally uses `unreachable`. The test checks if both engines correctly trap when `unreachable` is executed within nested blocks.

(assert_invalid
  (module (func (block (block (unreachable)) (block (i32.const 0)))))
  "type mismatch"
)