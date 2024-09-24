;; 10. **Test Description:**    Validate an `if` instruction within an exported function, which conditionally calls an imported function that modifies global state. The test should verify that global state changes correctly propagate across the module boundary, ensuring that such side-effects do not cause stack inconsistencies or erroneous execution paths.

(assert_invalid
  (module
    (import "env" "modifyGlobal" (func $modifyGlobal))
    (global $g (mut i32) (i32.const 0))
    (func $checkGlobal (result i32)
      (global.get $g)
    )
    (func (export "test")
      (i32.const 1)
      (if (then
        (call $modifyGlobal)
        (global.set $g (i32.const 42))
      ))
    )
  )
  "type mismatch"
)