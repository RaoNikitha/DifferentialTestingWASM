;; 10. **Test Description**:     - Develop global and local variable dependent logic within a function `F1` which calls `F2`.     - Integrate branches that modify globals and locals between and around `call` instructions.     - Include loop structures which affect and are affected by `call` outcomes and branches.     - **Constraint Checked**: Ensures correct handling and branching even with state changes caused by globals/locals.     - **Incorrect Branch Target Resolution**: State changes may be misplaced causing wrong branches and incorrect function call behavior.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $f2 (param i32) (result i32)
      get_local 0
      global.get $g
      i32.add
    )
    (func $f1 (param i32) (result i32)
      loop
        get_local 0
        call $f2
        global.set $g
        i32.const 1
        i32.add
        set_local 0
        br_if 0
      end
      global.get $g
    )
  )
  "type mismatch"
)