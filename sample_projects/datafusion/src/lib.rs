use datafusion_functions::math::pi::PiFunc;

#[derive(Debug)]
pub struct PiStructure {
    pub funcs: Vec<PiFunc>,
}

pub fn init(funcs: Vec<PiFunc>) {
    println!("datafusion-test {}", funcs.len());
}
