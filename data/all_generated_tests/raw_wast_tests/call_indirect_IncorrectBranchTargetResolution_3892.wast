;; 1. **Test Description:**    Create a test with a `call_indirect` instruction that resolves to a function in a table. The called function contains a branch instruction (`br`) that should jump to a valid block label. Confirm that the branch reaches the correct target block by using stack operations within the target block to verify behavior.

(assert_invalid
  (module
    (type $sig (func (result i32)))
    (type $target_sig (func))
    (func $target
      (block $B0
        (br $B0)
        (i32.const 1) ;; This should not be executed if br works correctly
      )
    )
    (table 1 funcref)
    (elem (i32.const 0) $target)
    (func $test
      (call_indirect (type $target_sig) (i32.const 0))
    )
    (export "test" (func $test))
  )
  "type mismatch"
)