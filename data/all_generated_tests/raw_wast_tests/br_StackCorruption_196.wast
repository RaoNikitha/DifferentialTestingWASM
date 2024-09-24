;; 7. **Branching with Intermediate Stack Modifications:**    Construct a control flow featuring branch instructions followed by operations that modify the operand stack, like additional pushes or pops. This test will highlight how each implementation handles intermediate operand modifications.

(assert_invalid
  (module (func $br-intermediate-stack-mod
    (block (br 0) (i32.const 1) (i32.add))
  ))
  "type mismatch"
)