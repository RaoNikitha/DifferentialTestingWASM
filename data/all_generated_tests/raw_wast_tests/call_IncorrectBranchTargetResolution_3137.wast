;; 6. **Test Description**:    - Define a function `F1` with multiple `br_if` and `br` instructions to various labels.    - Within this function, use multiple `call` instructions to both internal and imported functions.    - Labels should be strategically placed surrounding the `call` points to check branch target resolutions.    - **Constraint Checked**: Checking correct label resolution in the presence of multiple `call` instructions.    - **Incorrect Branch Target Resolution**: Incorrect branch target resolution may result in missing function calls or jumping outside intended code blocks.

(assert_invalid
  (module
    (type (func (param)))
    (func $multibr-call 
      (block $label1
        (call 1)
        (br_if $label1 (i32.const 0))
        (block $label2
          (call 2)
          (br $label2)
        )
      )
    )
    (func (param) (result)) 
    (func (param) (result))
    (import "env" "external_func" (func $imported (param)))
  )
  "type mismatch"
)