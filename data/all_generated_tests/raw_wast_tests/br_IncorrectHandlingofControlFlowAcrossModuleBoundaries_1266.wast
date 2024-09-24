;; 7. **Interleaved Calls and Br to End of Block:**    Construct a test where a series of interleaved calls between the main module and imported functions have `br` instructions targeting the end of blocks. This would validate stack unwinding and control resumption across boundaries.

(assert_invalid
  (module
    (func (import "env" "imported_func") (result i32))
    (func (result i32)
      (block (result i32)
        (call 0)
        (br 0)
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)