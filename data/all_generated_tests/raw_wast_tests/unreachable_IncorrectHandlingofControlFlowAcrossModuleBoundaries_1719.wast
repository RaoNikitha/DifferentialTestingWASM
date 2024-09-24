;; 10. **Test Case 10: Unreachable in Exported Function Containing Indirect Call**     - **Description:** Module A exports a function that contains an indirect call to a function within Module B that contains an `unreachable` instruction. This test ensures that indirect calls and their control flows, including trapping instructions, work correctly when spanning module boundaries.

(assert_invalid
  (module
    (type $typedef (func))
    (table anyfunc (elem $func_import))
    (import "moduleB" "func" (func $func_import))
    (func $func_main
      (call_indirect (type $typedef) (i32.const 0))
      (unreachable)
    )
    (export "main" (func $func_main))
  )
  "indirect call to unreachable"
)