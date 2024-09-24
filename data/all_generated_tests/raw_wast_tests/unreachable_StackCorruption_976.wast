;; 7. **Test Description:**    A function utilizing nested blocks where an inner block contains `unreachable` and subsequent stack operations in outer blocks. Tests stack consistency across nested scopes.    <br>**Constraint:** Verify that an outer block's stack operations are not influenced by the `unreachable` in an inner block.

(assert_invalid
  (module (func $type-nested-blocks-unreachable (block (block (unreachable) (i32.const 1)) (f64.const 0))))
  "type mismatch"
)