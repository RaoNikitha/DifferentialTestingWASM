;; 4. **Indirect Call Through Function Table to Imported `unreachable`:**    - Develop a test where a function table is used to call an imported function which contains an `unreachable` instruction. The indirect call should be followed by additional instructions in the caller module.    - **Constraint:** Ensures the trap from `unreachable` during an indirect call correctly halts all further execution, validating table call behavior.

(assert_invalid
  (module
    (import "env" "unreachable_fn" (func $unreachable_fn))
    (table 1 funcref)
    (elem (i32.const 0) $unreachable_fn)
    (func (result i32)
      (call_indirect (type (func (result i32))) (i32.const 0))
      (i32.const 42)
    )
  )
  "type mismatch"
)