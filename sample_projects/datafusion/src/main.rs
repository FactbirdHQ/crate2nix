use datafusion_test::{init, PiStructure};

pub fn main() {
    let val = PiStructure {
        funcs: vec![],
    };

    init(val.funcs);
}
