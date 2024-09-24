;; 5. **Test Recursive Function Calls**:    - Test multiple levels of recursive calls to examine the handling of call stacks and return values.    - **Constraint**: Ensuring the stack unwinds correctly for recursive calls.    - **Improper Call/Return Handling**: May result in stack overflows or incorrect stack unwinding.

(assert_invalid
  (module
    (func $recursive-call
      (local i32)
      local.get 0
      i32.const 1
      i32.sub
      local.set 0
      local.get 0
      i32.const 0
      i32.gt_s
      if
        call $recursive-call
      end
    )
    (func (param i32))
  )
  "function index out of bounds"
)